from rest_framework import serializers

class EmailSerializer(serializers.Serializer):
    email = serializers.EmailField()

    class Meta:
        fields = ("email",)

class ResetPasswordSerializer(serializers.Serializer):

    password = serializers.CharField(
        write_only = True,
        min_length = 4,
    )

    class Meta:
        fields = ("password",)