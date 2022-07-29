<?php
    include 'sql/queries.php';
    $account = $_SESSION['account'];
    $user->userSetInactive($account['user_id']);
    session_destroy();
    header('Location: user-home.php');
?>