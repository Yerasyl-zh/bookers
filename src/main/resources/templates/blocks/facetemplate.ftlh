<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Календарь с событиями</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js'></script>

</head>
<body>

<div class="container">
    <h2>Календарь событий</h2>
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

    <hr>

    <h3>Список событий:</h3>
    <table class="table">
        <thead>
        <tr>
            <th>#</th>
            <th>Название</th>
            <th>Начало даты</th>
            <th>Конец даты</th>
        </tr>
        </thead>
        <tbody>
        <#list events as event>
            <tr>
                <td>${event.id}</td>
                <td>${event.title}</td>
                <td>${event.start}</td>
                <td>${event.end}</td>
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
</body>
</html>
