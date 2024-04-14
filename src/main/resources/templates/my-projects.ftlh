<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Мои выполенные задачи</h1>
    <hr>
    <a class="btn btn-dark mt-3 mb-3" style="text-align: center; width: 100%"
       data-toggle="collapse" href="#collapseExample" role="button"
       aria-expanded="true" aria-controls="collapseExample">
        Добавить выполненную работу
    </a>
    <div class="collapse mb-3" id="collapseExample" style="">
        <form action="/project/create" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="projectName">Название выполненной работы</label>
                <input type="text" required class="form-control"
                       id="projectName" name="title">
            </div>
            <div class="form-group">
                <label for="description">Описание работы</label>
                <textarea required class="form-control" id="description" name="description"></textarea>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input required type="file" name="file1" id="file1">
                    <label class="custom-file-label" for="file1">Первая фотография к выполненной работе</label>
                </div>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file2" id="file2">
                    <label class="custom-file-label" for="file2">Вторая фотография к выполненной работе</label>
                </div>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file3" id="file3">
                    <label class="custom-file-label" for="file3">Третья фотография к выполненной работе</label>
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit" style="width: 100%" class="btn btn-dark">Добавить</button>
        </form>
    </div>
    <div class="card-columns">
        <#list projects as project>
            <a href="/project/${project.id}" class="project-link">
                <div class="card text-white bg-dark my-3 project">
                    <div class="card-top">
                        <form action="/project/delete/${project.id}" method="post" >
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button type="submit" class="btn btn-danger m-3">
                                Удалить
                            </button>
                        </form>
                    </div>
                    <img src="/images/${project.previewImageId}"
                         class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title">${project.title}</h5>
                    </div>

                </div>
            </a>
        <#else>
            <h1 style="text-align: center">Не найдено</h1>
        </#list>
    </div>
</@t.template>