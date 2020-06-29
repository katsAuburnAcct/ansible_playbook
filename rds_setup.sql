
# ssh into an ec2 instance in the public subnet of the image-gallery-m5 vpc
# For example, the "db-config-ec2-instance" : 54.172.140.215

# Connect to the postgresql instance:
psql -h image-gallery.cfgc1yt7uyzv.us-east-1.rds.amazonaws.com -U postgres
password: defaultpass

# create the "image_gallery" user:
create user image_gallery login password 'simple';

# Allow "postgres" super user to be able to create databases on behalf of "image_gallery" user
grant image_gallery to postgres;

# Create a database called "image_gallery" that is owned by the "image_gallery" user
create database image_gallery owner image_gallery;

# Exit out of the postgres connection & login as "image_gallery" user
psql -h image-gallery.cfgc1yt7uyzv.us-east-1.rds.amazonaws.com -U image_gallery
password: simple

# create "users" table within "image_gallery" db, owned by "image_gallery"
create table users (username varchar(100), password varchar(100), full_name varchar(200));