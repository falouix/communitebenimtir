<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
    <!-- Add icons to the links using the .nav-icon class
                 with font-awesome or any other icon font library -->
    <li class="nav-item ">
        <a href="{{ route("citoyen.home") }}" class="nav-link">
            <i class="nav-icon fa fa-dashboard"></i>
            <p>
                الرئيسية
            </p>
        </a>
    </li>
   
    <li class="nav-item has-treeview ">
        <a href="{{ route("citoyen.demandedocs") }}" class="nav-link ">
            <i class="nav-icon fa fa-file"></i>
            <p>
                مطالب الوثائق الادارية
            </p>
        </a>
    </li>
    <li class="nav-item has-treeview ">
        <a href="{{ route("citoyen.messages") }}" class="nav-link ">
            <i class="nav-icon fa fa-envelope"></i>
            <p>
                الرسائل
            </p>
        </a>
    </li>
</ul>