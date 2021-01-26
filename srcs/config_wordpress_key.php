<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'pma' );

/** MySQL database password */
define( 'DB_PASSWORD', 'pass' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );
/** Add define method. */
define('FS_METHOD', 'direct');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'BY;^qch46Io[c8EM}HLq3/]:9HTv|zuQ66::rq|v;u$}XHm:A.;C1{9B=zQ&+gNa');
define('SECURE_AUTH_KEY',  '5-Z/n$d9Ud;[D(c7Dx|TMf)b&,7IDeU|vsG6__k.#s/#C{?EUp;7~YJi+MN)|.-~');
define('LOGGED_IN_KEY',    'Q>Zvj_8<O%-0RV+`-ay`/!vMNXnH/6,iK*vr[Q}EWJk-)MQsY#|tMl+#K77BzE|R');
define('NONCE_KEY',        'CKZ[itW>P*^5nVqq@K`Q<sX+9qPn%dZ1t2:OdExUcKBwirdw]dK,&%~>Xz@?h93S');
define('AUTH_SALT',        '8]v-gPz2[ARvIk#qPHKq$E3Q4B4pX<I]I-hw?dfDK/u@RWUoA2%79mKGQUVfvcf(');
define('SECURE_AUTH_SALT', ')kKu1@?!.yLe)h;,_4:q]k-<uXlk1ne(Xd+!/xH6&_qFtsT!?,E=n@+e*UauPRL/');
define('LOGGED_IN_SALT',   '!, ;N]wty.G0oWIav55B#2?u-J${^oV+V5]9KV9,oC/l6zAh21+qEW5uM^X%E+Hv');
define('NONCE_SALT',       'aW>0?PQ-~5N?T+DumX0>-MLS9l@cxSv[/T6M]+UdwIS}[`EOtDi|81:2ToI?#SfG');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';