<#import "blocks/template.ftlh" as t>
<@t.template userByPrincipal>
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <div class="card shadow-lg">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="text-center">
                                    <#if user.photoPath??>
                                        <img src="/img/${user.photoPath}" alt="${user.firstName}" class="rounded-circle mb-4" width="200" height="200">
                                    </#if>
                                </div>
                            </div>
                            <div class="col-lg-8">
                                <h1 class="text-center mb-4" style="font-size: 2.5rem;">Информация о пользователе</h1>
                                <p><b style="font-size: 1.2rem;">Имя:</b> ${user.firstName} ${user.lastName}</p>
                                <p><b style="font-size: 1.2rem;">Номер телефона:</b> ${user.phoneNumber}</p>
                                <p><b style="font-size: 1.2rem;">Должность:</b> ${user.jobTitle}</p>
                                <p><b style="font-size: 1.2rem;">Возраст:</b> ${user.age}</p>
                                <p><b style="font-size: 1.2rem;">Дата рождения:</b> ${user.birthday}</p>
                                <p><b style="font-size: 1.2rem;">Образование:</b> ${user.education}</p>
                                <p><b style="font-size: 1.2rem;">Отдел:</b> ${user.department}</p>
                                <p><b style="font-size: 1.2rem;">Email:</b> ${user.email}</p>
                                <p><b style="font-size: 1.2rem;">Пол:</b>
                                    <#if user.male>
                                        Мужской
                                    <#else>
                                        Женский
                                    </#if>
                                </p>
                                <p><b style="font-size: 1.2rem;">Состояние брака:</b> ${user.maritalStatus}</p>
                                <p><b style="font-size: 1.2rem;">soft skills:</b> ${user.strengths}</p>
                                <p><b style="font-size: 1.2rem;">Github:</b> ${user.github}</p>
                                <p><b style="font-size: 1.2rem;">Город:</b> ${user.city}</p>
                                <p><b style="font-size: 1.2rem;">Адрес:</b> ${user.address}</p>
                                <p><b style="font-size: 1.2rem;">Национальность:</b> ${user.nationality}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <hr>
    <h1 style="text-align: center">Законченные работы пользователя ${user.firstName}  ${user.lastName}</h1>
    <br>
    <div class="card-columns">
        <#list projects as project>
            <a href="/project/${project.id}" class="project-link">
                <div class="card text-white bg-dark my-3 project">

                    <img src="/images/${project.previewImageId}"
                         class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title">${project.title}</h5>
                    </div>
                    <div class="card-footer">
                        ${project.user.firstName}
                    </div>
                </div>
            </a>
        <#else>
            <h1 style="text-align: center">Не найдено</h1>
        </#list>
    </div>
</@t.template>