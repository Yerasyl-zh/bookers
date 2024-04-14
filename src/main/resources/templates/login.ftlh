<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center; " >Авторизация</h1>
    <hr>
    <form action="/login " method="post">
        <div class="form-group" style="text-align: center;">
            <label for="email">Электронная почта</label>
            <input type="email" class="form-control" name="username" style="width: 600px; display: block; margin: 0 auto;">
            <div id="email" class="invalid-feedback">
                Неверныя электронная почта
            </div>
        </div>
        <div class="form-group" style="text-align: center;">
            <label for="password">Пароль</label>
            <input type="password" class="form-control" name="password" style="width: 600px; display: block; margin: 0 auto;">
            <div id="password" class="invalid-feedback">
                Неверный пароль
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit" style="width: 600px;display: block; margin: 0 auto;"  class="btn btn-dark">Войти</button>
    </form>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Face ID</title>
        <!-- подключаем стили Bootstrap для модального окна -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
    <form id="faceIdForm">
        <button type="button" onclick="openCameraModal()" style="width: 600px;display: block; margin: 0 auto;" class="btn btn-dark">FaceId</button>
    </form>

    <!-- Модальное окно с камерой -->
    <div class="modal" tabindex="-1" role="dialog" id="cameraModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Face ID Camera</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <video id="cameraFeed" width="100%" height="auto" autoplay></video>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" onclick="captureImage()">Capture</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Подключаем скрипты -->
    <script>
        // Открыть модальное окно с камерой
        function openCameraModal() {
            var modal = document.getElementById('cameraModal');
            modal.style.display = 'block';

            // Получаем доступ к видеопотоку с помощью getUserMedia API
            navigator.mediaDevices.getUserMedia({ video: true })
                .then(function(stream) {
                    var videoElement = document.getElementById('cameraFeed');
                    videoElement.srcObject = stream;
                })
                .catch(function(error) {
                    console.error('Ошибка доступа к камере: ', error);
                });
        }

        // Захват изображения с камеры
        function captureImage() {
            var videoElement = document.getElementById('cameraFeed');
            var canvas = document.createElement('canvas');
            canvas.width = videoElement.videoWidth;
            canvas.height = videoElement.videoHeight;
            var context = canvas.getContext('2d');
            context.drawImage(videoElement, 0, 0, canvas.width, canvas.height);

            // Преобразуем изображение в строку Base64
            var imageDataURL = canvas.toDataURL('image/jpeg');

            // Отправляем изображение на сервер или обрабатываем каким-либо другим способом
            console.log(imageDataURL);

            // Закрываем модальное окно
            var modal = document.getElementById('cameraModal');
            modal.style.display = 'none';
        }
    </script>

    <!-- Подключаем скрипты Bootstrap для работы модального окна -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
    </html>
    <hr>
    <form action="/registration">
        <button type="submit" style="width: 600px;display: block; margin: 0 auto;"  class="btn btn-dark">Зарегистрируйся</button>
    </form>
</@t.template>