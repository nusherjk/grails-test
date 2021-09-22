<ul class="list-group" style="list-style-type: none;">
    <li class="list-group-item">
        <div class="row">
            <div class="col-md-4"> Username</div>
            <div class="col-md-4"> First Name</div>
            <div class="col-md-4"> Last Name</div>

        </div>
    </li>
    <g:each in="${alluser}" var="usr">
        <li class="list-group-item">
            <div class="row">
                <div class="col-md-4"> ${usr.username}</div>
                <div class="col-md-4"> ${usr.firstname}</div>
                <div class="col-md-4"> ${usr.lastname}</div>
            </div>
        </li>

    </g:each>
</ul>