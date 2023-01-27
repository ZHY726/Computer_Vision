imds = imageDatastore('input/p2/train_imgs','IncludeSubfolders',true,'FileExtensions','.png',...
                            'LabelSource','foldernames');
layers = [
    imageInputLayer([32 32 3]);
    convolution2dLayer(3,16,'Padding','same');
    batchNormalizationLayer
    reluLayer();
    maxPooling2dLayer(2,'Stride',2);
    convolution2dLayer(3,16,'Padding',0); 
    batchNormalizationLayer
    reluLayer();
    maxPooling2dLayer(2,'Stride',2);
    fullyConnectedLayer(3)
    softmaxLayer();
    classificationLayer()];
options = trainingOptions('adam', ... 
    'InitialLearnRate', 0.001, ...
    'LearnRateSchedule', 'piecewise', ...
    'LearnRateDropFactor', 0.1, ...
    'LearnRateDropPeriod', 8, ...
    'L2Regularization', 0.004, ...
    'MaxEpochs', 10, ...
    'MiniBatchSize', 100, ...
    'Plots','training-progress', ...
    'Verbose', true);
tic
[net, info] = trainNetwork(imds, layers, options);
toc
imds_test = imageDatastore('input/p2/test_imgs', 'IncludeSubfolders',true, ...
    'LabelSource', 'foldernames');

predLabelsTest = net.classify(imds_test);
testing_accuracy = sum(predLabelsTest == imds_test.Labels) / numel(imds_test.Labels);

classes = {'airplane', 'automobile', 'truck'};
im = imread('input/p2/display_imgs/image254.png');
pred = net.classify(im);
subplot(3,2,1);
imshow(im);
title(strcat("predicted: ", string(pred)));
im = imread('input/p2/display_imgs/image547.png');
pred = net.classify(im);
subplot(3,2,2);
imshow(im)
title(strcat("predicted: ", string(pred)))
im = imread('input/p2/display_imgs/image869.png');
pred = net.classify(im);
subplot(3,2,3);
imshow(im)
title(strcat("predicted: ", string(pred)))
im = imread('input/p2/display_imgs/image888.png');
pred = net.classify(im);
subplot(3,2,4);
imshow(im)
title(strcat("predicted: ", string(pred)))
im = imread('input/p2/display_imgs/image1820.png');
pred = net.classify(im);
subplot(3,2,5);
imshow(im)
title(strcat("predicted: ", string(pred)))
im = imread('input/p2/display_imgs/image2072.png');
pred = net.classify(im);
subplot(3,2,6);
imshow(im)
title(strcat("predicted: ", string(pred)))