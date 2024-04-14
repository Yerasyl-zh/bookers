<#import "blocks/template.ftlh" as t>
<@t.template user>
    <div class="container mt-5">
        <h2 class="mb-4">Список работников</h2>
        <table class="table">
            <thead class="thead-dark">
            <tr>
                <th scope="col">Фото</th>
                <th scope="col">Имя</th>
                <th scope="col">Фамилия</th>
                <th scope="col">Номер телефона</th>
                <th scope="col">Направление</th>
                <th scope="col">Отдел</th>
                <th scope="col">Статус</th>
            </tr>
            </thead>
            <tbody>
            <#list users as user>
                <tr>
                <td> <img src="/img/${user.photoPath}"
                          width="50" height="50" class="rounded-circle"></td>
                <td>${user.firstName}</td>
                <td>${user.lastName}</td>
                <td>${user.phoneNumber}</td>
                    <td>${user.jobTitle}</td>
                <td>${user.department}</td>
                    <td>
                        <#if currentUserStatus == "Online">
                            <span style="color: green;">Online</span>
                        <#else>
                            <span style="color: red;">Offline</span>
                        </#if>
                    </td>
                </tr>
            </#list>
            </tbody>
        </table>
    </div>
</@t.template>