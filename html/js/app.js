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
                theme: "bootstrap-v4",
                progressBar: true,
                buttons: [
                    Noty.button('Aceptar [Y]', 'btn btn-success', function () {
                        n.close();
                    }),
                    Noty.button('Rechazar [N]', 'btn btn-danger', function () {
                        n.close();
                    })
                  ]
            }).show();
        } else if (data.close == true) {
            n.close();
        }
    })
});