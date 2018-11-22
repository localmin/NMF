function [wrt, T, V] = GCD_EU(X, itr, K)

    tic;
    exe_time = 0;

    wrt  = zeros( itr, 2 );
	% Getting size
	[R,C] = size( X );
	
	% initialization
	T = rand( R, K );
	V = rand( K, C );
	
	% avoid vibration 
	Xh = T * V;
	
	upper = X(:)' * Xh(:);
	lower = Xh(:)' * Xh(:);
	
	coef = sqrt( upper / lower );
	T = T * coef;
	V = V * coef;
	Xh = Xh * coef * coef;
	
	% Iteration by MU
	for loop=1:itr
	
        % Initialize for T
        St = zeros(R,K);
        Et = zeros(R,K);
        VV = V * V';
        diagVVt = diag(VV)';
        XV = X * V';
        GT = T * VV - XV;
        for i = 1:R
            St(i,:) = max(-T(i,:) + (1e-15) * ones(1,K), -GT(i,:) ./ diagVVt );
            Et(i,:) = -GT(i,:) .* St(i,:) - (1/2) * diagVVt .* St(i,:) .* St(i,:);
        end


        % Update T
        for i = 1:R
            a = 1;
            while(1)
                [~, k] = max(Et(i,:));
                T(i,k) = T(i,k) + St(i,k);
                GT(i,:) = GT(i,:) + St(i,k) * VV(k,:);
                St(i,:) = max(-T(i,:) + (1e-15) * ones(1,K), -GT(i,:) ./ diagVVt );
                Et(i,:) = -GT(i,:) .* St(i,:) - (1/2) * diagVVt .* St(i,:) .* St(i,:);

                if(a == K)
                    break;
                end
                a = a + 1;
                
            end
        end

        % Initialized V
        Sv = zeros(K,C);
        Ev = zeros(K,C);
        TT = T' * T;
        diagTTt = diag(TT);
        TX = T' * X;
        GV = TT * V - TX; 

        for j = 1:C
            Sv(:,j) = max(-V(:,j) + (1e-15) * ones(K,1), -GV(:,j) ./ diagTTt);
            Ev(:,j) = -GV(:,j) .* Sv(:,j) - (1/2) * diagTTt .* Sv(:,j) .* Sv(:,j);
        end

        % Update V
        for j = 1:C
            a = 1;
            while(1)
                [~, k] = max(Ev(:,j));
                V(k,j) = V(k,j) + Sv(k,j);
                GV(:,j) = GV(:,j) + Sv(k,j) * TT(:,k);
                Sv(:,j) = max(-V(:,j) + (1e-15) * ones(K,1) , -GV(:,j) ./ diagTTt);
                Ev(:,j) = -GV(:,j) .* Sv(:,j) - (1/2) * diagTTt .* Sv(:,j) .* Sv(:,j);
                if(a == K)
                    break;
                end
                a = a + 1;
            end
        end
        
        Xh = T * V;

        exe_time = exe_time + toc;

        error = norm(X - Xh, 'fro')^2;

        wrt(loop,:) = [ exe_time  error ];

        tic;
	end


   
end 