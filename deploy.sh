aws s3 cp ./cloudformation.yaml s3://gen-ai-cloudformations/ai-multimodal/stack.template
aws s3 cp ./lambda_zip_files s3://gen-ai-cloudformations/ai-multimodal/code --recursive

aws cloudformation create-stack \
  --stack-name ai-multimodal-stack-cli \
  --template-url https://gen-ai-cloudformations.s3.amazonaws.com/ai-multimodal/stack.template \
  --parameters ParameterKey=SourceCodeBucket,ParameterValue=gen-ai-cloudformations ParameterKey=SourceCodeprefix,ParameterValue=ai-multimodal/code/ \
  --capabilities CAPABILITY_NAMED_IAM
