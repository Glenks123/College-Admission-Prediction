function p = predict(theta, X)

m = size(X, 1);
p = zeros(m, 1);

pred = sigmoid(X*theta);

for i=1:length(pred),
    if pred(i) >= 0.5,
        p(i) = 1;
    endif
end

end