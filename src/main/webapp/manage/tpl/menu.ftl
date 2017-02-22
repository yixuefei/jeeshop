<#macro menu menus=[] topMenu="" currentMenu="首页">
<#--<script>-->
    <#--$(function(){-->
        <#--$('#side-menu').metisMenu();-->
        <#--$("a.menu-item").each(function(){-->
            <#--var href = $(this).data("href");-->
            <#--$(this).attr("href", href==""?"#":basepath + href);-->
        <#--})-->
        <#--var parent = $("a.menu-item.active").parent().parent();-->
        <#--if(parent.is("ul.nav")){-->
            <#--parent.addClass("in").parent().addClass("active");-->
        <#--}-->
    <#--});-->
<#--</script>-->
<div class="navbar-default sidebar" role="navigation">
    <div class="sidebar-nav navbar-collapse">
        <!-- /.navbar-top-links -->
        <ul class="nav" id="side-menu">
                <#--<#list menus as menu>-->
                    <#--<li>-->
                        <#--<a id="item_${menu.pid!"0"}_${menu.id!""}" data-href="${menu.url}" class="menu-item"><i class="fa fa-folder fa-fw"></i> ${menu.name!""}<#if menu.children?? && menu.children?size gt 0><span class="fa arrow"></span></#if></a>-->
                        <#--<#if menu.children?? && menu.children?size gt 0>-->
                            <#--<ul class="nav nav-second-level">-->
                            <#--<#list menu.children as menu>-->
                                <#--<li>-->
                                    <#--<a id="item_${menu.pid!"0"}_${menu.id!""}" data-href="${menu.url}"  class="menu-item ${(currentMenu==menu.name)?string("active","")}"><i class="fa fa-files-o fa-fw"></i> ${menu.name!""}</a>-->
                                <#--</li>-->
                            <#--</#list>-->
                            <#--</ul>-->
                        <#--</#if>-->
                    <#--</li>-->
                <#--</#list>-->
        </ul>
    </div>
    <!-- /.sidebar-collapse -->
</div>
<!-- /.navbar-static-side -->
<script type="text/javascript">

    var Menu = BUI.Menu;
    var data =[
        <#list menus as menu>
            {
                text: '${menu.name}',
                <#if menu.children?? && menu.children?size gt 0>
                    items: [
                        <#list menu.children as menu>
                            {
                                text: '${menu.name}',
                                href: '${menu.url}'
                            },
                        </#list>
                    ],
                <#else>
                    href:'${menu.url}'
                </#if>
            },
        </#list>
    ];



    var sideMenu = new Menu.SideMenu({
        render:'#side-menu',
        width:200,
        elCls: 'demo-menu',
        items :data
    });

    sideMenu.render();
    sideMenu.on('menuclick', function(e){
        window.location.href=e.item.get('href');
        console.log(e.item.get('href'));
    });

</script>

</#macro>