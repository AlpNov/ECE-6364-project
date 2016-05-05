function Im_o = hisstretch(Im)
	hist_map = cumsum(imhist(Im));
	hist_map = round(hist_map*double(max(Im(:)))/max(hist_map));
	[R,C] = size(Im);
	Im_o = zeros(size(Im));
	for r = 1:R
		for c = 1:C
			Im_o(r,c) = hist_map(Im(r,c)+1);
		end
	end
	Im_o = uint8(Im_o);
end
