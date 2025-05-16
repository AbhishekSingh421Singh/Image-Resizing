 # Node.js Lambda function

const AWS = require('aws-sdk');
const sharp = require('sharp');

const s3 = new AWS.S3();
const sns = new AWS.SNS();

exports.handler = async (event) => {
  const bucket = event.Records[0].s3.bucket.name;
  const key = decodeURIComponent(event.Records[0].s3.object.key.replace(/\+/g, ' '));

  const image = await s3.getObject({ Bucket: bucket, Key: key }).promise();
  const resized = await sharp(image.Body).resize(200, 200).toBuffer();

  const destKey = `resized/${key}`;
  await s3.putObject({
    Bucket: 'your-output-bucket-name',
    Key: destKey,
    Body: resized,
    ContentType: 'image/jpeg'
  }).promise();

  await sns.publish({
    Message: `Image ${key} processed and stored as ${destKey}`,
    TopicArn: 'your-sns-topic-arn'
  }).promise();
};
