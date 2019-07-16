$(function(){
    console.log("COURSE WORKS")
    listenForClick()
})

function listenForClick(){
    $("button#click-me").on('click', function(e) {
        e.preventDefault()
        getPost()
    })
}

function getPost(){
    $.ajax({
        url:'http://localhost:3000/courses',
        method: 'get',
        dataType: 'json',
    }).done(function(data) {
        console.log("out data is", data)
        let firstCourse = new Course(data[0])
        let myCourseHTML = firstCourse.courseHTML()
        document.getElementById('new-course').innerHTML += myCourseHTML
    })
}

// This is a constructor function
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

//prototype function that will add javascript onto page
Course.prototype.courseHTML = function() {
    let steps = this.steps.map(step => {
        return(`
            <ul>
                <li>${step.name}</li>
            </ul>
        `)
    }).join('')
    
    return(`
        <div>
            <h3>${this.title}</h3>
            <p>${this.description}<//p>
            <p>${steps}</p>
        </div>
    `)
}