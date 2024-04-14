<#import "blocks/template.ftlh" as t>
<@t.template user>
    <div class="container chat-container">
        <h1 class="text-center">Chat</h1>
        <div id="messages">
            <#list chat as message>
                <div class="card mb-3 message-wrapper ${message.sender.firstName} ${message.sender.lastName}">
                    <div class="card-body">
                        <div class="media">
                            <img src="/img/${message.sender.photoPath}" class="mr-3 avatar" alt="User Avatar" style="width: 50px; height: 50px; object-fit: cover; border-radius: 50%;">
                            <div class="media-body">
                                <h6 class="mt-0" style="font-size: 14px">${message.sender.firstName} ${message.sender.lastName}</h6>
                                <p class="message-content" style="font-size: 16px">${message.content}</p>
                            </div>
                            <div>
                                <form action="/deleteChat/${message.id}" method="post">
                                    <button class="btn btn-danger btn-sm" type="submit">Delete</button>
                                    <input type="hidden" value="${_csrf.token}" name="_csrf">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </#list>
        </div>
        <div class="card mt-3">
            <form action="/send" method="post">
                <div class="card-body">
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" name="content" placeholder="Type your message...">
                        <div class="input-group-append">
                            <button class="btn btn-primary" type="submit">Send</button>
                        </div>
                    </div>
                    <input type="hidden" value="${_csrf.token}" name="_csrf">
                </div>
            </form>
        </div>
    </div>
</@t.template>
