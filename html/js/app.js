var n;
$(document).ready(function () {
    window.addEventListener('message', function (event){
        var data = event.data;
        if(data.action === "open") {
            n = new Noty({
                type: 'success',
                layout: 'topRight',
                text: data.text,
                timeout: data.time,
                progressBar: true
            }).show();
        } else if (data.close == true) {
            n.close();
        }
    })
});