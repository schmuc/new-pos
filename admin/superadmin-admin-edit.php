<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Pos Inventory System">
    <title>Edit Account</title>
    <link rel="icon" href="../img/logo.png">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/custom.css">
    <script src="../js/functions.js" defer></script>
</head>
<?php
    include '../sql/queries.php';

    $account = $_SESSION['account'];

    if(!$account) header('Location: admin-login.php');
    else if(!$admin->adminEnabled($account['admin_id'])) header('Location: ../disabled.php');
    
    $adminID = $_REQUEST['id'];
    $adminSpecific = $admin->adminSpecificAdmin($adminID)->fetch_assoc();

    if(isset($_POST['superadmin-admin-submit'])){
        $profile = $_FILES['image']['name'];
        $profile_temp = $_FILES['image']['tmp_name'];
        $firstname = $_POST['firstname'];
        $lastname = $_POST['lastname'];
        $username = $_POST['username'];

        $admin->adminUpdateProfile($adminSpecific['admin_id'], $profile, $firstname, $lastname, $username);
        move_uploaded_file($profile_temp, "../img/uploaded/".$profile);
        header('Location: superadmin-admin.php');

    }
?>
<body>
    <section class="min-height-full relative">
        <?php
            require('admin-header.php');
            require('admin-side-navigation.php');
        ?>
        <div class="w-full flex justify-center">
            <form class="container border-show rounded-lg p-4 m-20 flex flex-col items-center w-2/5" method="post" enctype="multipart/form-data">
                <div class="border-show w-40 h-40 overflow-hidden">
                    <img id="admin-my-account-profile" src="../img/uploaded/<?php echo $adminSpecific['image']?>" alt="no image" width="200">
                </div>   
                <div class="flex justify-between w-full mt-12">
                    <label class="capitalize text-2xl" for="admin-ma-fl">change profile:</label>
                    <input class="w-1/2" type="file" id="admin-ma-fl" name="image" onchange="insertImage(this,'#admin-my-account-profile');">
                </div>
                <div class="flex justify-between w-full mt-8">
                    <label class="capitalize text-2xl" for="admin-ma-f">firstname:</label>
                    <input id="admin-ma-f" class="border-show rounded-lg p-2 w-1/2" type="text" value="<?php echo $adminSpecific['firstname']?>" name="firstname">
                </div>
                <div class="flex justify-between w-full mt-8">
                    <label class="capitalize text-2xl" for="admin-ma-l">lastname:</label>
                    <input id="admin-ma-l" class="border-show rounded-lg p-2 w-1/2" type="text" value="<?php echo $adminSpecific['lastname']?>" name="lastname">
                </div>
                <div class="flex justify-between w-full mt-8">
                    <label class="capitalize text-2xl" for="admin-ma-u">username:</label>
                    <input id="admin-ma-u" class="border-show rounded-lg p-2 w-1/2" type="text" value="<?php echo $adminSpecific['username']?>" name="username">
                </div>
                <input class="button1 border-show w-28 rounded-lg py-1 mt-10" type="submit" value="Update" name="superadmin-admin-submit">
                <a class="mt-4 underline capitalize link" href="superadmin-admin-edit-password.php?id=<?php echo $adminID;?>">change password</a>
            </form>
        </div>
    </section>
    <?php include '../footer.php';?>
</body>
</html>