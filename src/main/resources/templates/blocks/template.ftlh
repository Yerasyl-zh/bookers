<#macro template user>
    <!DOCTYPE html>
    <html lang="ru">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="/static/css/style.css">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
              integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
              crossorigin="anonymous">

        <title>Bookers</title>

    <body>
    <nav class="navbar navbar-dark bg-dark navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
            <a href="/">
                <span class="navbar-brand mb-0 h1">Bookers.inc</span>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/my/projects">Мой проекты</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/task">Задачи</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/user/list">Работники нашей компаний</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/event">Календарь</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/chat">Чат </a>
                    </li>

                </ul>
            </div>
            <#if user.email??>
                <div class="dropdown text-end">
                    <a href="/profile">
                        <div>
                            <#if user.photoPath??>
                                <img src="/img/${user.photoPath}" alt="mdo"
                                     width="32" height="32" class="rounded-circle">
                            </#if>
                        </div>
                    </a>
                </div>
               <#else>
            <button class="btn btn-light my-2 my-sm-0" type="button"
                    onclick="window.location.href = '/login'">
                Войти
            </button>
        </#if>
        </div>
    </nav>
    <div class="container mt-4">
        <#nested/>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
            integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
            crossorigin="anonymous"></script>



    </body>
    </html>
</#macro>