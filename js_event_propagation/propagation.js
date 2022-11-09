document.querySelectorAll('*').forEach(node => {
    // use the following option { capture: true } as a third arg to the eventlistener if you want to
    //make it use the Capture Phase instead of Bubble phase by default
    node.addEventListener('click', event => {
        // console.log(event.eventPhase)
        // const currentTarget = event.currentTarget
        // const eventPhase = event.eventPhase
        const { currentTarget, eventPhase } = event;
        let eventPhaseText = '';
        if(eventPhase === 0){
            eventPhaseText = 'none';
        } else if (eventPhase === 1){
            eventPhaseText = 'Capture';
        } else if (eventPhase === 2){
            eventPhaseText = 'At Target';
        } else {
            eventPhaseText = 'Bubble';
        }
        if (currentTarget.matches('.teams')){
            event.stopPropagation()
        }
        console.log(`Phase: ${eventPhaseText} - Node: ${currentTarget.tagName} - Class: ${currentTarget.className}`)
    })
})



