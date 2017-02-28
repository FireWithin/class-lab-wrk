#include <bits/stdc++.h>
using namespace std;

typedef long long int lld;
typedef long double ldb;

#define pb push_back
#define f first
#define s second

pair <int, int> heap[100010];
bool flag[100010];

int cur = 1;

void hd(){
	int pos = 1, l, r;
	while(1){
		l = pos << 1;
		r = pos << 1 | 1;

		if(!flag[pos] or (!flag[l] and !flag[r])) break;
		if(flag[r]){
			if(heap[l].s <= heap[r].s and heap[l].s < heap[pos].s){
				swap(heap[l], heap[pos]);
				pos = l;
				continue;
			}
			else if(heap[r].s <= heap[l].s and heap[r].s < heap[pos].s){
				swap(heap[r], heap[pos]);
				pos = r;
				continue;
			}
			else break;
		}
		else{
			if(heap[l].s < heap[pos].s){
				swap(heap[l], heap[pos]);
				pos = l;
				continue;
			}
			else break;
		}
	}	
}

void hu(int pos){
	while(1){
		if(pos==1) break;
		if(heap[pos].s < heap[pos >> 1].s){
			swap(heap[pos], heap[pos >> 1]);
			pos >>= 1;
		}
		else break;
	}
}

void insert(int i, int w){
	heap[cur].f = i;
	heap[cur].s = w;
	flag[cur] = 1;
	hu(cur++);
}

void pop(){
	heap[1] = heap[--cur];
	flag[cur] = 0;
	hd();
}

pair <int, int> top(){
	return heap[1];
}

int size(){
	return cur-1;
}

int n, e;
vector < pair<int , int> > adj[100010];
int dis[100010];
bool vis[100010];

void Djk(int src){
	for(int i = 1; i <= n; i++){
		dis[i] = INT_MAX;
	}
	dis[src] = 0;
	for(int i = 1; i <= n; i++){
		insert(i, dis[i]);
	}
	pair <int, int> get;
	while(size()){
		get = top();
		pop();	
		if(vis[get.f]) continue;
		vis[get.f] = 1;
		for(auto j: adj[get.f]){
			if(dis[j.f] > get.s + j.s){
				insert(j.f, dis[j.f] =  get.s + j.s);
			}
		}
	}
}

main(){
	cin >> n >> e;
	for(int i = 0, u, v, w; i < e; ++i){
		cin >> u >> v >> w;
		adj[u].pb({v, w});
		adj[v].pb({u, w});
	}
	Djk(1);
	for(int i = 1; i <= n; i++){
		cout << i << ":  " << dis[i] << '\n';
	}
}
