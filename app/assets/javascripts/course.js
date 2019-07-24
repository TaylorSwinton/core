$(function(){
    console.log("COURSE WORKS")
    courseWorkers()
})

// function listenForClick(){
//     $("button#click-me").on('click', function(e) {
//         e.preventDefault()
//         getPost()
//     })
// }

const courseWorkers = () => {
    
    $("form#new_course").on("submit", function(e) {
        e.preventDefault()
        const serialData = $(this).serialize()

         $.post("/courses", serialData).done(function(data) {
             debugger
       });
    });

    // console.log("This should be written")
    // $("#app_container").empty()
    // const newCourse = new Course(data)
    // const htmlToAdd = newCourse.formatShow()
    // $("#app_container").append(htmlToAdd)

    $(".js-more").on('click', function() {
        var id = $(this).data("id");
        $.get("/courses/" + id + ".json", function(data) {
        $("#body-" + id).html(data["description"])
        })
    })

    // $(".js-next").on("click", function(e) {
    //     e.preventDefault();
    //         var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    //         $.getJSON("/courses/" + nextId + "/steps", function(data){
    //             $(".courseTitle").text(data["title"] + " Course");
    //             $(".courseCategory").text("Category: " + data["category"]);
    //             $(".courseTime").text("Time that should be spent on course: " + data["time"] + " Minutes");
    //             $(".courseDescription").text("Description: " +  data["description"]);
                
    //             for(let i = 0, l = data.steps.length; i < l; i++){
    //                 $(".courseSteps").text(data.steps.name)
    //                 $(".stepDesc").text("Description: " + data.steps.description)
    //             };

    //             $(".js-next").attr("data-id", data["id"]);
    //      });
    // });

    $(document).on("click", ".courseIndex", function(e) {
        e.preventDefault()
        $('div#app_container').html('')
        let id = $(this).attr('id')
        fetch(`/courses/${id}.json`)
        .then(res => res.json())
        .then(course => {
            let newCourse = new Course(course)
            let courseHTML = newCourse.formatShow()    
            
            $('div#app_container').append(courseHTML)
        });
    });
}

// function getPost(){
//     $.ajax({
//         url:'http://localhost:3000/courses',
//         method: 'get',
//         dataType: 'json',
//     }).done(function(data) {
//         console.log("out data is", data)
//         let firstCourse = new Course(data[0])
//         let myCourseHTML = firstCourse.courseHTML()
//         document.getElementById('new-course').innerHTML += myCourseHTML
//     })
// }

// Constructor Functions
class Course {
    constructor (object){
        this.id = object.id
        this.title = object.title
        this.description = object.description
        this.course_rating = object.course_rating
        this.category = object.category
        this.time = object.time
        this.course_rating = this.course_rating
        this.steps = object.steps
    }
}

// function Course(course) {
//         this.id = course.id
//         this.title = course.title
//         this.description = course.description
//         this.category = course.category
//         this.time = course.time
//         this.steps = course.steps
// }

//Prototype Functions
Course.prototype.formatShow = function() {
    let steps = this.steps.map(step => {
                return(`
                    <ul>
                        <li>${step.name}</li>
                    </ul>
                `)
            }).join('')
            
            return(`
                <div>
                    <h1>${this.title} Course</h1>
                    <h3>Category: ${this.category}</h3>
                    <h4>Time that should be spent on course: ${this.time} Minutes</h4>
                    <p><strong>Description:</strong> ${this.description}</p>
                    <p>${steps}</p>
                </div>
                <form action="/courses">
                     <input type="submit" value="Courses" />
                </form>
            `)
}

// Course.prototype.courseHTML = function() {
//     let steps = this.steps.map(step => {
//         return(`
//             <ul>
//                 <li>${step.name}</li>
//             </ul>
//         `)
//     }).join('')
    
//     return(`
//         <div>
//             <h3>${this.title}</h3>
//             <p>${this.description}<//p>
//             <p>${steps}</p>
//         </div>
//     `)
//}