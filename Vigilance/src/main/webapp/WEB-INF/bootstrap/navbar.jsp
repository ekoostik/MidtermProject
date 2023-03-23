<nav class="navbar bg-dark navbar-expand-lg bg-body-tertiary" data-bs-theme="dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#"><img class="nav" src="../../images/MTLogo3.png" width="130" height="60"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-xl-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="home.do">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="viewAllEvents.do">Events</a>
        </li>
         <li class="nav-item">
          <a class="nav-link" href="#" >Neighbors</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            View
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="viewAllposts.do">Posts</a></li>
            <li><a class="dropdown-item" href="viewAllEvents.do">Events</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="viewAllreports.do" style="background-color: red">Reports</a></li>
          </ul>
        </li>
      </ul>
    </div>
    <div class="d-lg-flex justify-content-center">
      <form class="d-flex " role="search">
        <input class="form-control me-auto mb-2 mb-lg-0" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
      </div>
     <div class="d-flex justify-content-end"> 
     <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Account <img class="profile" src="${loggedinuser.profilePic} width="40" height="40">
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="profile.do">Profile</a></li>
            <li><a class="dropdown-item" href="account.do"> Account</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="logout.do">Logout</a></li>
          </ul>
        </li>
      </ul>
      </div>
    </div>
         
  </div>
</nav>