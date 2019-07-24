$(function() {
    console.log("STEP WORKS")
    stepWorkers()
})

const stepWorkers = () => {
    $(document).on('click', 'js-next', function() {
        let nextId = $(this).attr("data-id") + 1;
        fetch(`courses/${nextId}/steps`)
    })
}



