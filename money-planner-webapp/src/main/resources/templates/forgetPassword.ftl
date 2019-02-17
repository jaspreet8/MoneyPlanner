<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css' />

  <style>
    body {
        font-family: 'Roboto', sans-serif;
        font-size: 48px;
    }
  </style>
</head>

<body style="margin: 0; padding: 0;">
  <table>
    <tbody>
      <tr>
        <td style="background-color: #45CAFC; padding: 5px 5px 5px 5px" align="center">
        <img style="display: block;" src="cid:logo.png" alt="${baseUrl}" /></td>
      </tr>

      <tr>
        <td style="background-color: #EAEAEA; padding: 5px 5px 10px 10px">
          <p>Dear ${user.name},
          <br />
          Changing your password is simple. Please click on the link below and follow the instructions in order to reset your password.</p>
          <a href="${baseUrl}${resetUrl}">${baseUrl}${resetUrl}<a>
          <p>This link will expire in 24 hours.</p></a></a>
        </td>
      </tr>

      <tr>
        <td style="background-color: #777777; padding: 10px 10px 10px 10px">
          <p>Thank you,</p>
          <p>Team MoneyPlanner</p>
        </td>
      </tr>
    </tbody>
  </table>
</body>
</html>
