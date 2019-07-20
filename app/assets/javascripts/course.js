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

function courseWorkers() {
    $('#new_course').on("submit", function(e) {
        e.preventDefault()
        const values = $(this).serialize()

        $.post("/courses", values).done(function(data) {
            //  console.log(data)
            $("#app-container").html("")
            const newCourse = new Course(data)
            const htmlToAdd = newCourse.formatShow()

            $("#app-container").html(htmlToAdd)
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
// class Course {
//     constructor (object){
//         this.id = object.id
//         this.title = object.title
//         this.description = object.description
//         this.course_rating = object.course_rating
//         this.category = object.category
//         this.time = object.time
//         this.course_rating = this.course_rating
//         this.steps = object.steps
//     }
// }

function Course(course) {
        this.id = course.id
        this.title = course.title
        this.description = course.description
        this.category = course.category
        this.time = course.time
        this.steps = course.steps
}

//Prototype Functions
Course.prototype.formatShow = function() {
    let courseHtml = `
    <h1>${this.title}</h1>
    <h3>${this.category}</h3>
    <h4>${this.time}</h4>
    <p>${this.description}</p>
    `
    
    return courseHtml
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