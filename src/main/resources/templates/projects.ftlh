<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Готовые работы нашей команды</h1><hr>
    <form method="get" action="/">
        <div class="form-row">
            <div class="form-group col-md-12">
                <label for="searchWord">Поиск готовых работ</label>
                <input type="text" name="searchWord" <#if searchWord??>value="${searchWord}"</#if> class="form-control"
                       id="searchWord">
            </div>
            <button style="width: 100%" type="submit" class="btn btn-dark">Поиск</button>
        </div>
    </form>
    <hr>
    <div class="card-columns">
        <#list projects as project>
            <a href="/project/${project.id}" class="project-link">
                <div class="card text-white bg-dark my-3 project">

                    <img src="/images/${project.previewImageId}"
                         class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title">${project.title}</h5>
                    </div>
                </div>
            </a>
        </#list>
    </div>
</@t.template>