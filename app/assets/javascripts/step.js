$(function() {
    console.log("STEP WORKS")
    stoppingStep()
})

function stoppingStep() {
    $("#new-step").on('submit', function(e) {
        e.preventDefault()
        console.log("Stop Step")
    })
}



