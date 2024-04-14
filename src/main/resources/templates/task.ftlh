<#import "blocks/template.ftlh" as t>
<@t.template user>
    <div class="row">
        <div class="col">
            <h1>Доска задач</h1>
            <!-- Form for adding a task -->
            <#if user.isAdmin()>
            <form action="/addTask" method="post">
                <div class="form-group">
                    <label for="title">Заголовок :</label>
                    <input type="text" class="form-control" id="title" name="title" required>
                </div>
                <div class="form-group">
                    <label for="description">Описание:</label>
                    <input type="text" class="form-control" id="description" name="description" required>
                </div>
                <div class="form-group">
                    <label for="status">Статус:</label>
                    <select class="form-control" id="status" name="status" required>
                        <option value="To Do">To Do</option>
                        <option value="In Progress">In Progress</option>
                        <option value="Done">Done</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">Добавить задачу</button>
                <input type="hidden" value="${_csrf.token}" name="_csrf">
            </form>
            </#if>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <!-- Display tasks according to their status -->
            <div class="card">
                <div class="card-header">To Do</div>
                <div class="card-body">
                    <ul class="list-group">
                        <#list tasks as task>
                            <#if task.status == "To Do">
                                <li class="list-group-item">${task.title} - ${task.description}</li>
                                <form action="/updateTaskStatus" method="post">
                                    <input type="hidden" name="taskId" value="${task.id}">
                                    <input type="hidden" name="newStatus" value="In Progress">
                                    <button type="submit" class="btn btn-primary">Начать работу </button>
                                    <input type="hidden" value="${_csrf.token}" name="_csrf">
                                </form>
                                <form action="/deleteTask/${task.id}" method="post">
                                    <input type="hidden" value="${_csrf.token}" name="_csrf">
                                    <button type="submit" class="btn btn-danger">Удалить задачу</button>
                                </form>
                            </#if>
                        </#list>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col">
            <!-- Display tasks with status "In Progress" -->
            <div class="card">
                <div class="card-header">In Progress</div>
                <div class="card-body">
                    <ul class="list-group">
                        <#list tasks as task>
                            <#if task.status == "In Progress">
                                <li class="list-group-item">${task.title} - ${task.description}</li>
                                <form action="/updateTaskStatus" method="post">
                                    <input type="hidden" name="taskId" value="${task.id}">
                                    <input type="hidden" name="newStatus" value="Done">
                                    <button type="submit" class="btn btn-primary">Сделано</button>
                                    <input type="hidden" value="${_csrf.token}" name="_csrf">
                                </form>

                                <form action="/deleteTask/${task.id}" method="post">
                                    <input type="hidden" value="${_csrf.token}" name="_csrf">
                                    <button type="submit" class="btn btn-danger">Удалить задачу</button>
                                </form>
                            </#if>
                        </#list>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col">
            <!-- Display tasks with status "Done" -->
            <div class="card">
                <div class="card-header">Done</div>
                <div class="card-body">
                    <ul class="list-group">
                        <#list tasks as task>
                            <#if task.status == "Done">
                                <li class="list-group-item">${task.title} - ${task.description}</li>
                                <form action="/deleteTask/${task.id}" method="post">
                                    <input type="hidden" value="${_csrf.token}" name="_csrf">
                                    <button type="submit" class="btn btn-danger">Удалить задачу</button>
                                </form>
                            </#if>
                        </#list>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</@t.template>
