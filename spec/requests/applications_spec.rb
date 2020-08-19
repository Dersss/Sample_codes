RSpec.describe 'Applications API' do
    # Initialize the test data
    let!(:job) { create(:job, requirements:'Not blank') }
    let!(:applications) { create_list(:application, 1, job_id: job.id, justifications: 'Justified', code: 'test.com') }
    let(:job_id) { job.id }
    let(:id) { applications.first.id }
  
    # Test suite for GET /jobs/:job_id/applications
    describe 'GET /jobs/:job_id/applications' do
      before { get "/jobs/#{job_id}/applications" }
  
      context 'when job exists' do
        it 'returns status code 200' do
          expect(response).to have_http_status(200)
        end
  
        it 'returns all job applications' do
          expect(json.size).to eq(1)
        end
      end
  
      context 'when job does not exist' do
        let(:job_id) { 0 }
  
        it 'returns status code 404' do
          expect(response).to have_http_status(404)
        end
  
        it 'returns a not found message' do
          expect(response.body).to match(/Couldn't find Job/)
        end
      end
    end
  
    # Test suite for GET /jobs/:job_id/applications/:id
    describe 'GET /jobs/:job_id/applications/:id' do
      before { get "/jobs/#{job_id}/applications/#{id}" }
  
      context 'when job application exists' do
        it 'returns status code 200' do
          expect(response).to have_http_status(200)
        end
  
        it 'returns the job' do
          expect(json['id']).to eq(id)
        end
      end
  
      context 'when job application does not exist' do
        let(:id) { 0 }
  
        it 'returns status code 404' do
          expect(response).to have_http_status(404)
        end
  
        it 'returns a not found message' do
          expect(response.body).to match(/Couldn't find Application/)
        end
      end
    end
  
    # Test suite for PUT /jobs/:job_id/applications
    describe 'POST /jobs/:job_id/applications' do
      let(:valid_attributes) { { name: 'John Doe', job_id: '1', justification: 'I like to report news', code: 'example.com' } }
  
      context 'when request attributes are valid' do
        before { post "/jobs/#{job_id}/applications", params: valid_attributes }
  
        
      end
  
      context 'when an invalid request' do
        before { post "/jobs/#{job_id}/applications", params: {} }
  
        it 'returns status code 422' do
          expect(response).to have_http_status(422)
        end
  
        it 'returns a failure message' do
          expect(response.body).to match(/Validation failed: Name can't be blank/)
        end
      end
    end
  
    # Test suite for PUT /jobs/:job_id/applications/:id
    describe 'PUT /jobs/:job_id/applications/:id' do
      let(:valid_attributes) { { name: 'Mozart', job_id: '1' } }
  
      before { put "/jobs/#{job_id}/applications/#{id}", params: valid_attributes }
  
      context 'when item exists' do
        it 'returns status code 204' do
          expect(response).to have_http_status(204)
        end
  
        it 'updates the application' do
          updated_application = Application.find(id)
          expect(updated_application.name).to match(/Mozart/)
        end
      end
  
      context 'when the application does not exist' do
        let(:id) { 0 }
  
        it 'returns status code 404' do
          expect(response).to have_http_status(404)
        end
  
        it 'returns a not found message' do
          expect(response.body).to match(/Couldn't find Application/)
        end
      end
    end
  
    # Test suite for DELETE /jobs/:id
    describe 'DELETE /jobs/:id' do
      before { delete "/jobs/#{job_id}/applications/#{id}" }
  
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end