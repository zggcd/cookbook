name             'PrometheusAPI'
maintainer       'YOUR_COMPANY_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures PrometheusAPI'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'php'
depends 'mysql'
depends 'nginx'
depends 'hhvm'
depends 'composer'
depends 'php5-fpm'