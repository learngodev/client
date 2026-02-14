generated_dir=./lib/generated

# Generate Dart code from .proto files
proto_dir=./lib/proto
proto_generated_dir=$generated_dir/proto

rm -r $proto_generated_dir/*
mkdir -p $proto_generated_dir
protoc --dart_out=grpc:$proto_generated_dir -I$proto_dir $proto_dir/notification.proto
protoc --dart_out=grpc:$proto_generated_dir -I$proto_dir $proto_dir/conversation.proto