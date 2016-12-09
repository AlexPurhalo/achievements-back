<h3>Installation</h3>
<ul>
    <li>$ export PROVIDER=AWS</li>
    <li>$ export S3_BUCKET_NAME=your_bucket_name</li>
    <li>$ export AWS_ACCESS_KEY_ID=your_id_key</li>
    <li>$ export AWS_SECRET_ACCESS_KEY=your_secret_key</li>
    <li>$ export AWS_REGION=your_region</li>
    <li>$ bundle install</li>
    <li>$ bundle exec rake db:migrate</li>
    <li>$ bundle exec rake db:test:prepare</li>
    <li>$ rspec</li>
    <li>$ foreman start</li>
</ul>