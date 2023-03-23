<nav class="navbar bg-dark navbar-expand-lg bg-body-tertiary" data-bs-theme="dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#"><img class="nav" src="../../images/MTLogo3.png" width="130" height="60"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-xl-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="adminHome.do">Home</a>
        </li>
        </ul>
    </div>
     <div class="d-flex justify-content-end"> 
     <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Account <img class="profile" src="${loggedinadmin.profilePic} width="40" height="40">
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="profile.do">Profile</a></li>
            <li><a class="dropdown-item" href="account.do"> Account</a></li>
            <li><a class="dropdown-item" href="adminDashboard.do"> Administration</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="logout.do">Logout</a></li>
          </ul>
        </li>
      </ul>
      </div>
    </div>
         
  </div>
</nav>