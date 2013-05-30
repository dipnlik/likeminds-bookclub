# LikeMinds Bookclub

A bookclub Rails application for LikeMinds.  Also available at http://lit-dawn-4917.herokuapp.com.

## Known issues

- Views still include generated links to the user list and edit/destroy links

  The links don't work (see `UsersController#logged_user_cannot_edit_other_users`)  but still, these should be located and removed, while improving the users' flow inside the app.

- Destroying the logged in user should log out the user
- Layout needs improvements
