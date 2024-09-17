let notifyId = 0

parseMessage = function(message) {
    const regexColor = /~([^h])~([^~]+)/g;	
    const regexBold = /~([h])~([^~]+)/g;	
    const regexStop = /~s~/g;	
    const regexLine = /\n/g;		
    const newLine = /~n~/g;			

    message = message.replace(regexColor, "<span class='$1'>$2</span>").replace(regexBold, "<span class='$1'>$2</span>").replace(regexStop, "").replace(regexLine, "<br />").replace(newLine, "<br />");
        
    return message;
}

window.addEventListener("message", function(event) {
    const item = event.data;
    const id = notifyId
    notifyId += 1
    
    $("#notifyContainer").append(`
        <div class="notify" id="notify-${id}">
            <span></span>
        </div>
    `)

    $(`#notify-${id}`).fadeIn(250)
    $(`#notify-${id}`).css("border-color", item.color)
    $(`#notify-${id}`).animate({
        width: "80%"
    }, 500, function() {
        $(`#notify-${id} span`).html(parseMessage(item.text))
    })
    
    $.post(`https://${GetParentResourceName()}/notifyId`, JSON.stringify({id: id}), function(id) {
        setTimeout(() => {
            $(`#notify-${id} span`).html("")
            $(`#notify-${id}`).css("background-color", item.color)
            $(`#notify-${id}`).animate({
                width: "0%"
            }, 500, function() {
                $(`#notify-${id}`).fadeOut(250).remove()
            })

        }, 500);
    })

});
