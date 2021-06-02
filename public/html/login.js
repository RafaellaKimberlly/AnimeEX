const sign_in_btn = document.querySelector("#sign-in-btn");
const sign_up_btn = document.querySelector("#sign-up-btn");
const container_cadastro = document.querySelector(".container-cadastro");

sign_up_btn.addEventListener('click', () => {
    container_cadastro.classList.add("sign-up-mode");
});

sign_in_btn.addEventListener('click',() => {
    container_cadastro.classList.remove("sign-up-mode")
});


    
    function cadastrar() {
    aguardar();
    var formulario = new URLSearchParams(new FormData(form_cadastro));
    fetch("/usuarios/cadastrar", {
        method: "POST",
        body: formulario
    }).then(function (response) {
        
        if (response.ok) {

            alert('Cadastro realizado com sucesso <3<3');
           // window.location.href='./cadastro.html';

        } else {

            console.log('Erro de cadastro!');
            response.text().then(function (resposta) {
               // div_erro.innerHTML = resposta;
            });
            finalizar_aguardar();
        }
    });

    return false;
}

function aguardar() {
    //btn_entrar.disabled = true;
    img_aguarde.style.display='block';
    //div_erro.style.display='none';
}

function finalizar_aguardar() {
    //btn_entrar.disabled = false;
   img_aguarde.style.display='none';
   // div_erro.style.display='block';
}

function entrar() {
    aguardar();
    var formulario = new URLSearchParams(new FormData(form_login));
    fetch("/usuarios/autenticar", {
        method: "POST",
        body: formulario
    }).then(resposta => {

        if (resposta.ok) {

            resposta.json().then(json => {

                sessionStorage.login_usuario_meuapp = json.login;
                sessionStorage.nome_usuario_meuapp = json.nomeUsuario;

                window.location.href = 'html/mangas.html';
            });

        } else {

            alert('Erro de login, Favor preencher corretamente todos os campos!!');

            console.log('Erro de login!');

            resposta.text().then(texto => {
                console.error(texto);
               finalizar_aguardar(texto);
            });
        }
    });

    return false;
}
