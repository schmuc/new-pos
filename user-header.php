<header id="user-header" class="top-navigation w-full border-show fixed top-0 left-0 h-16 flex py-2 px-4 justify-between" style="z-index: 100;">
    <div>
        <img class="h-full" src="img/logo.png" alt="no image">
    </div>
    <div class="flex items-center h-full">
        <img class="h-1/2 m-4 on-hover-pointer" src="img/icon/notification-white.svg" alt="no image" onclick="navigate('user-notification.php');">
        <div class="flex items-center h-full relative" onclick="logoutPopup('#user-header-popup');">
        <div class="w-8 h-8 overflow-hidden mr-2 border-show rounded-full">
            <img class="rounded-full h-full w-full on-hover-pointer" src="img/uploaded/<?php echo $account['image'];?>" alt="no image"  >
        </div>
            <h1 class="font-semibold capitalize on-hover-pointer"><?php echo $account['firstname'] . " " . $account['lastname']?></h1>
            <?php require_once('user-header-popup.php');?>
        </div> 
    </div>
</header>   