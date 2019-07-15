$(function(){
    console.log("IT WORKS")
    listenForClick()
})

function listenForClick(){
    $("button#click-me").on('click', function(e) {
        e.preventDefault()
        console.log("you clicked the button")
    })
}