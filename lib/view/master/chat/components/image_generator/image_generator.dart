import '../../../../../virtualguide.dart';

class ImageGenerator extends StatelessWidget {
  const ImageGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: AppText.virtualGuide,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SubmitButton(
            title: AppText.imageGenerator,
            onTap: () async {
              /*
              Certainly! Below is an explanation of the provided code snippet for image generation using the OpenAI API with DALL·E:

                ```curl
                curl https://api.openai.com/v1/images/generations \
                  -H "Content-Type: application/json" \
                  -H "Authorization: Bearer $OPENAI_API_KEY" \
                  -d '{
                    "model": "dall-e-3",
                    "prompt": "a white siamese cat",
                    "n": 1,
                    "size": "1024x1024"
                  }'
                ```

                Explanation:

                1. **`curl`**: A command-line tool used for making HTTP requests.
                2. **`https://api.openai.com/v1/images/generations`**: The endpoint for generating images.
                3. **`-H "Content-Type: application/json"`**: Specifies that the content being sent is in JSON format.
                4. **`-H "Authorization: Bearer $OPENAI_API_KEY"`**: Authenticates the request using your OpenAI API key.
                5. **`-d '{ ... }'`**: Provides the data payload for the POST request.
                6. **`"model": "dall-e-3"`**: Specifies the DALL·E model to be used (in this case, version 3).
                7. **`"prompt": "a white siamese cat"`**: The text prompt that influences the generated image. In this example, it's "a white siamese cat."
                8. **`"n": 1`**: Indicates that you want to generate one image.
                9. **`"size": "1024x1024"`**: Specifies the size of the generated image.

                The response will contain the generated image data.
                Keep in mind that you need to replace `$OPENAI_API_KEY` with your actual OpenAI API key.
                Additionally, you can explore the OpenAI Cookbook for more details on working with DALL·E 3 and its new features.

               */

              final res = await UserService.imageGenerationWithGPT(
                context: context,
                model: 'dall-e-3',
                prompt: 'Enter Your Prompt',
                count: 1,
                size: '1024x1024',
                quality: 'hd',
                response_format: 'url',
              );
              print("response => ${res}");
            },
          ),
        ],
      ),
    );
  }
}
