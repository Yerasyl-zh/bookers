<#import "blocks/template.ftlh" as t>
<@t.template user>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js'></script>
<div class="container">
    <h2>Календарь событий</h2>
      <#if user.isAdmin()>
    <form action="/addEvent" method="post">
        <div class="form-group">
            <label for="title">Название события:</label>
            <input type="text" class="form-control" id="title" name="title" required>
        </div>
        <div class="form-group">
            <label for="start">Начало события:</label>
            <input type="date" class="form-control" id="start" name="start" required>
        </div>
        <div class="form-group">
            <label for="end">Конец события:</label>
            <input type="date" class="form-control" id="end" name="end" required>
        </div>
        <button type="submit" class="btn btn-primary">Добавить событие</button>
        <input type="hidden" value="${_csrf.token}" name="_csrf">
    </form>
      </#if>

    <hr>

    <h3>Список событий:</h3>
    <table class="table">
        <thead>
        <tr>
            <th>#</th>
            <th>Название</th>
            <th>Начало даты</th>
            <th>Конец даты</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <#list events as event>
            <tr>
                <td>${event.id}</td>
                <td>${event.title}</td>
                <td>${event.start}</td>
                <td>${event.end}</td>
                <td>  <form action="/deleteEvent/${event.id}" method="post">
                        <input type="hidden" value="${_csrf.token}" name="_csrf">
                        <button type="submit" class="btn btn-danger">Удалить событие</button>
                    </form> </td>
            </tr>
        </#list>
        </tbody>
    </table>

    <hr>

    <h3>Календарь:</h3>
    <div id='calendar'></div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth',
            events: [
                <#list events as event>
                {
                    title: "${event.title}",
                    start: "${event.start}",
                    end: "${event.end}"
                }
                <#if event?has_next>,</#if>
                </#list>
            ]
        });

        calendar.render();
    });
</script>
<div id='calendar'></div>
</@t.template>
