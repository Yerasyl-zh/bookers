<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Добавление информации о себе</h1>
    <hr>
    <form action="/additionalInfo" method="post" enctype="multipart/form-data">

        <div class="form-group">
            <label for="age">Возраст</label>
            <input type="number" class="form-control" id="age" name="age">
        </div>
        <div class="form-group">
            <label for="birthday">Дата рождения</label>
            <input type="date" class="form-control" id="birthday" name="birthday">
        </div>
        <div class="form-group">
            <label for="education">Образование</label>
            <input type="text" class="form-control" id="education" name="education">
        </div>
        <div class="form-group">
            <label for="department">Отдел</label>
            <select class="form-control" id="department" name="department">
                <option value="development">Отдел разработки</option>
                <option value="quality_assurance">Отдел тестирования</option>
                <option value="product">Отдел продукта</option>
            </select>
        </div>
        <div class="form-group">
            <label for="male">Пол</label>
            <select class="form-control" id="male" name="male">
                <option value="true">Мужской</option>
                <option value="false">Женский</option>
            </select>
        </div>
        <div class="form-group">
            <label for="maritalStatus">Семейное положение</label>
            <input type="text" class="form-control" id="maritalStatus" name="maritalStatus">
        </div>

        <div class="form-group">
            <label for="strengths">soft skills</label>
            <textarea class="form-control" id="strengths" rows="3" name="strengths"></textarea>
        </div>
        <div class="form-group">
            <label for="city">Город</label>
            <input type="text" class="form-control" id="city" name="city">
        </div>
        <div class="form-group">
            <label for="address">Адрес</label>
            <input type="text" class="form-control" id="address" name="address">
        </div>
        <div class="form-group">
            <label for="nationality">Национальность</label>
            <input type="text" class="form-control" id="nationality" name="nationality">
        </div>
        <div class="form-group">
            <label for="github">Github (необязательно)</label>
            <input type="text" class="form-control" id="github" name="github">
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="hidden" name="id" value="${user.id}">
        <button type="submit" style="width: 100%" class="btn btn-dark">Сохранить</button>
    </form>
    <#if errorMessage??>
        <h2 style="color: red">${errorMessage}</h2>
    </#if>

</@t.template>
