function output = my_imfilter(image, filter)
% This function is intended to behave like the built in function imfilter()
% See 'help imfilter' or 'help conv2'. While terms like "filtering" and
% "convolution" might be used interchangeably, and they are indeed nearly
% the same thing, there is a difference:
% from 'help filter2'
%    2-D correlation is related to 2-D convolution by a 180 degree rotation
%    of the filter matrix.

% Your function should work for color images. Simply filter each color
% channel independently.

% Your function should work for filters of any width and height
% combination, as long as the width and height are odd (e.g. 1, 7, 9). This
% restriction makes it unambigious which pixel in the filter is the center
% pixel.

% Boundary handling can be tricky. The filter can't be centered on pixels
% at the image boundary without parts of the filter being out of bounds. If
% you look at 'help conv2' and 'help imfilter' you see that they have
% several options to deal with boundaries. You should simply recreate the
% default behavior of imfilter -- pad the input image with zeros, and
% return a filtered image which matches the input resolution. A better
% approach is to mirror the image content over the boundaries for padding.

% % Uncomment if you want to simply call imfilter so you can see the desired
% % behavior. When you write your actual solution, you can't use imfilter,
% % filter2, conv2, etc. Simply loop over all the pixels and do the actual
% % computation. It might be slow.
% output = imfilter(image, filter);


%%%%%%%%%%%%%%%%
% Your code here
%%%%%%%%%%%%%%%%
    I = double(image);
    f = double(filter);
    [f_width, f_height] = size(f);
    [I_width, I_height, channels_count] = size(I);
    % fprintf("Size of I: %d, %d\n", I_width, I_height);
    % fprintf("Size of f: %d, %d\n", f_width, f_height);
    output = zeros(I_width, I_height, channels_count);
    for channel = 1:channels_count
        for a = 1:I_width
            for b = 1:I_height
                sum = 0;
                % fprintf("*** Image center row: %d , col: %d ***\n", a, b);
                for i = 1:f_width
                    for j = 1:f_height
                        % fprintf("filter row: %d, col: %d\n", i, j);
                        filter_value = f(i, j);
                        % fprintf("Processing image row and col: %d, %d\n", a-floor(f_width/2)+i-1, b-floor(f_height/2)+j-1);
                        image_row = a-floor(f_width/2)+i-1;
                        image_col = b-floor(f_height/2)+j-1;

                        if image_row < 1 || image_row > I_width || image_col < 1 || image_col > I_height
                            image_value = 0;
                        else
                            image_value = I(image_row, image_col, channel);
                        end
                        % fprintf("filter_value: %f\n", filter_value);
                        % fprintf("Processing image value: %f\n", image_value);
                        sum = sum + filter_value*image_value;
                        % fprintf("Sum: %f\n", sum);
                    end
                end
                output(a, b, channel) = sum;
                % fprintf("Sum for %d, %d: %d:, %f\n", a, b, channel, sum);
            end
        end
    end
end




