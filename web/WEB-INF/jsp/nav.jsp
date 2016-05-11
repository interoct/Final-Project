<fmt:setLocale value="${sessionScope.local}"/>
<fmt:setBundle basename="localization.local" var="loc"/>
<fmt:message bundle="${loc}" key="local.nav.home" var="home"/>
<fmt:message bundle="${loc}" key="local.nav.categories" var="categories"/>
<fmt:message bundle="${loc}" key="local.nav.admin" var="admin"/>
<fmt:message bundle="${loc}" key="local.login" var="login"/>
<fmt:message bundle="${loc}" key="local.logout" var="logout"/>
<fmt:message bundle="${loc}" key="local.admin.edit.categories" var="edit_categories"/>
<fmt:message bundle="${loc}" key="local.admin.edit.users" var="edit_users"/>
<fmt:message bundle="${loc}" key="local.admin.edit.goods" var="edit_goods"/>
<fmt:message bundle="${loc}" key="local.locbutton.name.ru"
             var="ru_button"/>
<fmt:message bundle="${loc}" key="local.locbutton.name.en"
             var="en_button"/>
<fmt:message bundle="${loc}" key="local.label.login"
             var="login_label"/>
<fmt:message bundle="${loc}" key="local.label.password"
             var="password_label"/>
<fmt:message bundle="${loc}" key="local.login"
             var="b_login"/>
<fmt:message bundle="${loc}" key="local.singup.text"
             var="singup"/>

<jsp:useBean id="user" class="by.epam.eshop.entity.User" scope="session"/>

<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">E-SHOP</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li><a href="${pageContext.request.contextPath}/index.jsp">${home}</a></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">${categories}<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Category1</a></li>
                        <li><a href="#">Category2</a></li>
                        <li><a href="#">Category3</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <c:if test="${(not empty sessionScope.user) and (sessionScope.user.role eq 'ADMIN')}">
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">${admin}<span
                                class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/edit_users">${edit_users}</a>
                            </li>
                            <li><a href="#">${edit_categories}</a></li>
                            <li><a href="#">${edit_goods}</a></li>
                        </ul>
                    </li>
                </c:if>
                <li class="dropdown">
                    <c:choose>
                        <c:when test="${empty sessionScope.user.firstName}">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span
                                    class="glyphicon glyphicon-log-in"></span> ${login}</a>
                            <ul class="dropdown-menu">
                                <li>
                                    <div>
                                        <form action="Controller" method="post">
                                            <input type="hidden" name="command" value="login"/>

                                            <c:out value="${login_label}"/>: <br/>
                                            <input type="text" name="login" value=""/> <br/>

                                            <c:out value="${password_label}"/>: <br/>
                                            <input type="password" name="password" value=""/><br/>

                                            <input type="submit" value="${b_login}"/>
                                        </form>
                                        <a href="${pageContext.request.contextPath}/registration.jsp">${singup}</a>
                                    </div>
                                </li>
                            </ul>
                        </c:when>
                        <c:otherwise>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span
                                    class="glyphicon glyphicon-user"></span> ${user.firstName}</a>
                            <ul class="dropdown-menu">
                                <li>
                                    <form action="${pageContext.request.contextPath}/Controller" method="post">
                                        <input type="hidden" name="command" value="logout"/>
                                        <input type="submit" value="${logout}"/><br/>
                                    </form>
                                </li>
                            </ul>
                        </c:otherwise>
                    </c:choose>

                </li>
                <li>
                    <form action="${pageContext.request.contextPath}/Controller" method="post" style="padding-top: 9px">
                        <input type="hidden" name="command" value="change-local"/>
                        <input type="hidden" name="local" value="en"/>
                        <input type="submit" value="${en_button}" class="btn btn-link"/><br/>
                    </form>
                </li>
                <li>
                    <form action="${pageContext.request.contextPath}/Controller" method="post"
                          style="padding-top: 9px ">
                        <input type="hidden" name="command" value="change-local"/>
                        <input type="hidden" name="local" value="ru"/>
                        <input type="submit" value="${ru_button}" class="btn btn-link"/><br/>
                    </form>
                </li>
            </ul>
        </div>
    </div>
</nav>