<#import "blocks/template.ftlh" as t>
<@t.template user>
    <div id="myCarousel" class="carousel slide" data-bs-ride="carousel" style="background-color: #343a40;">
        <div class="carousel-indicators">
            <#list images as image>
                <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="${image_index}" <#if image_index == 0>class="active"</#if> aria-current="true" aria-label="Slide ${image_index+1}"></button>
            </#list>
        </div>
        <div class="carousel-inner">
            <#list images as image>
                <div class="carousel-item <#if image_index == 0>active</#if>">
                    <img src="/images/${image.id}" class="d-block mx-auto" alt="..." style="max-height: 300px;">
                </div>
            </#list>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
    <hr>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-body">
                        <h1 class="text-center">${project.title}</h1>
                        <p class="text-center">${project.description}</p>
                        <p class="text-center">Номер телефона сотрудника: <b>${authorProject.phoneNumber}</b></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <hr>
    <div class="text-center">
        <img src="/img/${authorProject.photoPath}" alt="${authorProject.firstName}" width="64" height="64" class="rounded-circle">
        <p class="mt-2" style="font-size: 18px;">${authorProject.firstName}</p>
    </div>
</@t.template>
