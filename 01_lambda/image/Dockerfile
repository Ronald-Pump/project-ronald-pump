FROM public.ecr.aws/lambda/python:3.11

# Copy requirements.txt to the Lambda task root
COPY requirements.txt ${LAMBDA_TASK_ROOT}

# Install the necessary Python packages
RUN pip install -r requirements.txt

# Copy the src directory to the Lambda task root
COPY src ${LAMBDA_TASK_ROOT}

# Set the CMD to point to the handler function
CMD ["lambda_function.lambda_handler"]