<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Регистрация</h1>
    <hr>
    <form action="/registration" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="firstName">Имя</label>
            <input type="text" class="form-control" required id="firstName" name="firstName">
        </div>
        <div class="form-group">
            <label for="lastName">Фамилия</label>
            <input type="text" class="form-control" required id="lastName" name="lastName">
        </div>
        <div class="form-group">
            <label for="email">Электронная почта</label>
            <input type="email" class="form-control" id="email" required name="email">
        </div>
        <div class="form-group">
            <label for="phoneNumber">Номер телефона</label>
            <input type="text" class="form-control" id="phoneNumber" required name="phoneNumber">
        </div>
        <div class="form-group">
            <label for="jobTitle">Ваше направление</label>
            <select class="form-control" id="jobTitle" required name="jobTitle">
                <option value="">Выберите направление</option>
                <option value="backend dev">Backend Developer</option>
                <option value="frontend dev">Frontend Developer</option>
                <option value="fullstack dev">Fullstack Developer</option>
                <option value="mobile dev">Mobile Developer</option>
                <option value="data scientist">Data Scientist</option>
                <option value="devops engineer">DevOps Engineer</option>
                <option value="system administrator">System Administrator</option>
            </select>
        </div>
        <div class="form-group">

            <input type="file" class="form-control-file" id="photoPath" name="file">
        </div>

        <div class="form-group">
            <label for="password">Пароль</label>
            <input type="password" class="form-control" id="password" required name="password">
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit" style="width: 100%" class="btn btn-dark">Зарегистрироваться</button>
    </form>
    <#if errorMessage??>
        <h2 style="color: red">${errorMessage}</h2>
    </#if>

</@t.template>
