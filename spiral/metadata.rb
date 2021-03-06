name              'spiral'
maintainer        'Spiralworks Core'
maintainer_email  'devops@spiralwks.com'
license           'Private'
description       'Configures basic infrastruture resused within the contexts of many inhouse applications'
version           '0.0.1'

depends 'apt'
depends 'supervisor'
depends 'build-essential'
depends 'hhvm3'
depends 'mongodb'
depends 'elasticsearch'
depends 'graylog2'
depends 'nfs'
depends 'couchbase'

supports 'ubuntu' 
