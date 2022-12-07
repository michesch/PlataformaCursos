<div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Configurações</div>
                            <a class="nav-link" href="cursos.jsp">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-book-open-reader"></i></div>
                                Cursos
                            </a>
                            <a class="nav-link" href="usuarios.jsp">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-users"></i></div>
                                Usuários
                            </a>
                            <a class="nav-link" href="workshops.jsp">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-chalkboard-user"></i></div>
                                Workshops
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logado como:</div>
                        <%
                            String nomeUsuario = (String) session.getAttribute("NomeUsuario");
                            out.print(nomeUsuario);
                        %>
                    </div>
                </nav>
</div>