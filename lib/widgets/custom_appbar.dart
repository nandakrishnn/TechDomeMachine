import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techdome/constants/colors.dart';
import 'package:techdome/constants/functions.dart';
import 'package:techdome/constants/height_width.dart';
import 'package:techdome/view/movie_overview.dart';
import 'package:techdome/viewmodels/search_bloc/search_results_bloc.dart';
import 'package:techdome/widgets/custom_textformfeild.dart';

class CustomAppBar extends StatefulWidget {
  final String coverImageUrl;

  const CustomAppBar({
    required this.coverImageUrl,
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  final TextEditingController searchEdit = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
  bool _isDropdownVisible = false;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      expandedHeight: MediaQuery.of(context).size.height * .53,
      pinned: true,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        background: AnimatedContainer(
          duration: const Duration(milliseconds: 1000),
          color: Colors.black.withOpacity(0),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
              setState(() {
                _isDropdownVisible = false;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  image: NetworkImage(
                    
                    widget.coverImageUrl
                  
                  ),
                
                  fit: BoxFit.cover,
                  
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppConstants.kheight10,
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 8,
                            spreadRadius: 2,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/5fdfa98001a201aed81d5119d0456915-removebg-preview.png',
                                height: 70,
                                width: 70,
                              ),
                              const Text(
                                'Streamify',
                                style: TextStyle(
                                  color: AppColors.pureWhite,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.cast,
                            color: Colors.white,
                            size: 32,
                          ),
                          AppConstants.kheight10,
                        

                        ],
                      ),
                    ),
                    AppConstants.kheight10,
                    BlocBuilder<SearchResultsBloc, SearchResultsState>(
                      builder: (context, state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomSearchField(
                              suffixcon: Icons.close,
                              onPressedbutton: () {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                setState(() {
                                  _isDropdownVisible = false;
                                  searchEdit.clear();
                                });
                              },
                              focus: searchFocusNode,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  context
                                      .read<SearchResultsBloc>()
                                      .add(LoadServerData(value));
                                  setState(() {
                                    _isDropdownVisible = true;
                                  });
                                }
                              },
                              hintText: 'Search',
                              fillColor: Colors.white,
                              prefixIcon: Icons.search,
                              controller: searchEdit,
                            ),
                            AppConstants.kheight10,
                            if (state is GetServerDataLoading)
                              const LinearProgressIndicator(),
                            if (state is GetServerDataLoaded &&
                                _isDropdownVisible)
                              Container(
                                color: AppColors.bgColor,
                                height:
                                    MediaQuery.of(context).size.height * .35,
                                child: ListView.builder(
                                  itemCount: state.data.length,
                                  itemBuilder: (context, index) {
                                    final movie = state.data[index];
                                    return Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: ListTile(
                                        leading: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          child: Image.network(
                                            movie.posterURL,
                                            width: 67,
                                            height: 67,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return buildImageUnavailable();
                                            },
                                          ),
                                        ),
                                        title: Text(
                                          movie.title,
                                          style: const TextStyle(
                                              color: AppColors.pureWhite),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => MovieOverview(
                                                id: movie.id,
                                                imdbId: movie.imdbId,
                                                imgeUrl: movie.posterURL,
                                                title: movie.title,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                            if (state is GetServerDataFailed)
                              Text(
                                state.errorMsg,
                                style: const TextStyle(color: Colors.red),
                              ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
