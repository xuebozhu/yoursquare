<form action="procesar_login.php" method="POST">
    <div class="form_container">
        <label><b>Username</b></label>
        <input type="text" placeholder="Enter Username" name="uname" required>

        <label><b>Password</b></label>
        <input type="password" placeholder="Enter Password" name="psw" required>

        <button type="submit">Login</button>
        <input type="checkbox" checked="checked"> Remember me
        </div>
        <div>
           <button type="button" class="cancelbtn">Cancel</button>
           <span class="psw">Forgot <a href="#">password?</a></span>
        </div>
</form>