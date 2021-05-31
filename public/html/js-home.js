function menu(){
    document.getElementById("menu-bar").classList.toggle("change");
    document.getElementById("nav").classList.toggle("change");
    document.getElementById("menu-bg").classList.toggle("change-bg");
    }

    function enviar(){
        var nome_cont = nome_cont.value;
        var email_cont = email_cont.value;
        var msg_cont = msg_cont.value;

        var enviocoment = (cont_nome == "" && cont_email == "" && msg_cont == "" ?
        "comentário enviado com sucesso, por favor aguarde a resposta da equipe" : "Favor preencher todos os campos");
        alert(enviocoment);
    }
    